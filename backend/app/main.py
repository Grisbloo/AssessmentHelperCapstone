from fastapi import FastAPI

app = FastAPI()

# makes sure fastapi actually runs
@app.get("/health")
def health():
    return {"status": "ok"}
