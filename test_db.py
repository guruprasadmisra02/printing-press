import os, psycopg2

url = os.environ.get("DATABASE_URL")
print("Connecting to:", url)

try:
    conn = psycopg2.connect(url)
    print("✅ Connection successful!")
    conn.close()
except Exception as e:
    print("❌ Connection failed:", e)
