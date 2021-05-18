# TODO: Make it possible to change the pipectl verion
FROM gcr.io/pipecd/pipectl:v0.9.14

COPY register-event.sh /register-event.sh

RUN chmod +x /register-event.sh

ENTRYPOINT ["/register-event.sh"]
