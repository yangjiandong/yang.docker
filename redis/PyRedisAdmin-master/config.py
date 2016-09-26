base = {
    'servers': [
        {'index': 0,
         'name': 'server1',
         'host': '192.168.99.100',
         'port': 6379,
         'password': '',
         'databases': 1
         },
        {'index': 1,
         'name': 'server2',
         'host': '192.168.99.100',
         'port': 6379,
         'databases': 10
         },
    ],
    'seperator': ':',
    'maxkeylen': 100
}
media_prefix = "pyred_media"

host = '0.0.0.0'
port = 8085
debug = True

scan_batch = 10000
show_key_self_count = False

lang = 'zh_CN'

admin_user = 'admin'
admin_pwd = 'admin'
