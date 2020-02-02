<attacks>
  <div class="container">
    <table class="table text-center">
    <div>
      <h1>Attacks</h1>
      <div class="md-form mt-0 search">
        <input class="monster_search form-control-sm ml-3 w-75" placeholder="Search by Element" type="text" value=''>
      </div>
    </div>
   <thead>
     <tr>
       <th scope="col">Id</th>
       <th scope="col">Name</th>
       <th scope="col">Element</th>
       <th scope="col">Description</th>
     </tr>
   </thead>
   <tbody>
     <tr each='{attack in attacks}'>
       <td>{attack.id}</td>
       <td>{attack.name}</td>
       <td><img src="{attack.image}">{attack.element}</td>
       <td>{attack.description}</td>
     </tr>
   </tbody>
   </table>
  </div>
  <script>
  var self = this
  self.attacks = {}
  self.on('mount', function(){
      get_attacks();
      $('.monster_search').on('change', function(){
        filterMonsters();
      })
      $('.monster_search').focus(function() {
        this.value = "";
        get_attacks();
     });
  })
  var get_attacks = function(){
      CLIENT.api.get_attacks()
          .done(function(attacks){
              self.attacks = attacks
          })
          .fail(function(error){
              alert(error.responseJSON)
          })
          .always(function(){
              self.update()
          })
  }
  var filterMonsters = function(){
   console.log($('.monster_search')[0].value)
   CLIENT.api.get_attacks_by_type($('.monster_search')[0].value)
     .done(function(attacks){
         self.attacks = attacks
     })
     .fail(function(error){
         alert(error.responseJSON)
     })
     .always(function(){
         self.update()
     })
   }
  </script>
  <style>
  h1 {
     text-align: center;
     color: #000;
  }
  .search {
     padding: 20px;
     width: 50%;
     margin: 10px 225px 10px auto;
  }
  .monster_search {
     background-color: #3cb5f9;
     border: 1px solid #000!important;
  }
  </style>
</attacks>