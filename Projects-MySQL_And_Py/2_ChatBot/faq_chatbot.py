from langgraph.graph import StateGraph
from typing import TypedDict
from rapidfuzz import fuzz, process

faq_data = {
    "What is LangGraph?": "A Python framework called LangGraph is used to create stateful, multi-agent programs that are driven by language models (LLMs).",

    "Who created LangGraph?": "Harrison Chase, the original developer of LangChain, led the team at LangChain that produced LangGraph.",

    "When was LangGraph introduced?": "It was introduced in 2024.",

    "How does LangGraph work?": "It enables you to specify a graph of nodes (such as agents or functions) with data (state) flowing between them.",

    "It is built using which language?": "LangGraph is built in Python.",

    "Is LangGraph available on GitHub?": "Yes, it is available on GitHub."
}

class FAQState(TypedDict):
    question: str
    answer: str

def find_best_answer(state: FAQState) -> FAQState:
    user_question = state["question"]
    best_match, score, _ = process.extractOne(
        user_question, faq_data.keys(), scorer=fuzz.token_sort_ratio
    )

    if score > 60:
        answer = faq_data[best_match]
    else:
        answer = "Sorry, I don't know the answer."

    return {"question": user_question, "answer": answer}

builder = StateGraph(FAQState)
builder.add_node("get_answer", find_best_answer)
builder.set_entry_point("get_answer")
faq_graph = builder.compile()

print("FAQ Bot ready! Ask your questions or type 'exit' to quit.\n")

while True:
    user_input = input("You: ").strip()
    if user_input.lower() == "exit":
        print("Bye, Have a nice day!")
        break

    result = faq_graph.invoke({"question": user_input, "answer": ""})
    print("Bot:", result["answer"])
