from http import HTTPStatus
from flask import Blueprint
from flasgger import swag_from
from app.api.model.welcome import WelcomeModel
from app.api.schema.welcome import WelcomeSchema
from app.api.model.user import User
from app.api.schema.user import UserSchema

home_api = Blueprint('api', __name__)


@home_api.route('/')
@swag_from({
    'responses': {
        HTTPStatus.OK.value: {
            'description': 'Welcome to the Flask Starter Kit',
            'schema': WelcomeSchema
        }
    }
})
def welcome():
    """
    1 liner about the route
    A more detailed description of the endpoint
    ---
    """
    result = WelcomeModel()
    return WelcomeSchema().dump(result), 200


@home_api.route('/user')
@swag_from({
    'responses': {
        HTTPStatus.OK.value: {
            'description': 'User Rest API',
            'schema': UserSchema
        }
    }
})
def user():
    """
    系统管理用户服务
    维护用户，增删改查
    ---
    """
    user = User(name="Monty", email="monty@python.org")
    return UserSchema().dump(user), 200
