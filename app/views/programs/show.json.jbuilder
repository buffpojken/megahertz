json.id             @program.id
json.title          @program.title
json.description    @program.description
json.duration       Time.at(@program.duration*60).utc.strftime("%H:%M:%S")
json.type           "program"