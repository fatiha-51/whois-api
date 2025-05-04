from fastapi import FastAPI, Query
from fastapi.responses import JSONResponse
import subprocess

app = FastAPI()

@app.get("/whois")
def get_whois(domain: str = Query(...)):
    try:
        result = subprocess.check_output(["whois", domain], stderr=subprocess.STDOUT, text=True)
        return {"domain": domain, "raw": result}
    except subprocess.CalledProcessError as e:
        return JSONResponse(status_code=500, content={"error": e.output})
