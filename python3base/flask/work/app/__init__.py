from flask import Flask, jsonify
from flasgger import Swagger
from app.api.route.home import home_api
from werkzeug.exceptions import HTTPException
from werkzeug.exceptions import default_exceptions
# from flask_graphql import GraphQLView
# from .schemas import schema


def create_app():
    app = Flask(__name__)
    # app.add_url_rule('/graphql', view_func=GraphQLView.as_view(
    #     'graphql', schema=schema, graphiql=True)
    # )

    @app.route('/')
    def hello_world():
        return jsonify({'data': 'Hello, World!'})

    @app.errorhandler(Exception)
    def handle_error(e):
        code = 500
        if isinstance(e, HTTPException):
            code = e.code
        return jsonify(error=str(e)), code

    for ex in default_exceptions:
        app.register_error_handler(ex, handle_error)

    app.config['SWAGGER'] = {
        'title': 'Flask API Starter Kit',
    }
    swagger = Swagger(app)

    app.register_blueprint(home_api, url_prefix='/api')

    return app
