FROM python:3.9
WORKDIR /J-D-G
COPY . .
CMD ["python","new.py"]