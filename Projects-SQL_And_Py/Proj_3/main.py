from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.responses import JSONResponse

# Initialize FastAPI app
app = FastAPI()

# Root path to confirm the server is running
@app.get("/")
async def root():
    return {"message": "Welcome to the FastAPI app!"}

# Pydantic model for text input
class TextInput(BaseModel):
    text: str

# POST endpoint to clean and summarize text
@app.post("/clean/")
async def clean_text(data: TextInput):
    cleaned_text = data.text.strip()  # Clean extra spaces
    summarized_text = cleaned_text[:50]  # Summarize text by limiting to 50 characters
    return JSONResponse(content={
        "cleaned_text": cleaned_text,
        "summarized_text": summarized_text
    })
