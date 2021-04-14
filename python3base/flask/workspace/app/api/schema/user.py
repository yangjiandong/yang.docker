from flask_marshmallow import Schema
from marshmallow import fields


class UserSchema(Schema):
    name = fields.Str()
    email = fields.Email()
    created_at = fields.DateTime()
