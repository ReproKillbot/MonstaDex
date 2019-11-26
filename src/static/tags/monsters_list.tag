<monsters_list>

    <monster each="{monster in monsters}" mon="{monster}"></monster>


    <script>
        var self = this;
        self.monsters = {}
        self.on('mount', function(){
            get_monsters();
        })

        var get_monsters = function(){
            CLIENT.api.get_monsters()
                .done(function(monsters){
                    console.log("Monsters == " + monsters)
                    self.monsters = monsters
                })
                .fail(function(error){
                    console.log("Errors == " + error)
                })
                .always(function(){
                    self.update()
                })
        }
    </script>
</monsters_list>
