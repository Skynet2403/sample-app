FROM python
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
WORKDIR /home/myapp
ENV FLASK_APP=sample_app.py
EXPOSE 5050
CMD ["flask", "run", "--host=0.0.0.0", "--port=5050", "--without-threads"]
