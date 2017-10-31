. venv/bin/activate
pip install -r backend/requirements.txt
kill `cat backend/gunicorn.pid`
(cd backend; gunicorn -w 4 -b 0.0.0.0:80 -D host_funcs:app -p gunicorn.pid)


