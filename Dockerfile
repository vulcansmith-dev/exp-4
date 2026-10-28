FROM python:3.9
WORKDIR /exp-4
COPY . .
CMD ["python","new.py"]