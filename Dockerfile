FROM python:3.9-alpine as build

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM python:3.9-alpine

# הגדרת ספריית העבודה
WORKDIR /app

# העתקת התלויות והקוד מהשלב הקודם
COPY --from=build /app /app

# פקודת ההרצה של האפליקציה
CMD ["python", "app.py"]
