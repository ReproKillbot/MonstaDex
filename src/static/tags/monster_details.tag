<monster>
    <!--    <h1>{mon.monsterName}</h1>
        <p>{mon.family}</p>
        <p>{mon.element}</p>
        <p>{mon.description}</p>-->

    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-lg-4">
                <!-- Card Flip -->
                <div class="card-flip {monster-flip: flipped}" onclick={flip_me} >
                    <div class="front">
                        <!-- front content -->
                        <div class="card monster-card">
                            <div class="card-body">

                                <h5 class="card-title text-center">{mon.monsterName} = {picked}</h5>
                                <img class="card-img-top " src="{mon.image}" alt="Card image cap">
                                <p class="card-text">{mon.description}</p>
                            </div>

                            <div class="row button-row">
                               <div class="col">

                               </div>
                                  <div class="col">
                                    <button type="button" class="btn btn-secondary" if={!picked} onclick={pick_monster}>Pick me!</button>
                                    <button type="button" class="btn btn-secondary" if={picked} onclick={pick_monster}>Unpick</button>
                                  </div>
                                  <div class="col">

                                  </div>
                                </div>

                            <div class="card-footer text-muted">
                                <div class="row text-center align-middle">
                                    <div class="col">{mon.family}</div>
                                    <div class="col-xs-2 v-divider"></div>
                                    <div class="col">{mon.element}<img class="logo" src="{mon.element_logo}"></div>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div class="back">
                        <div class="card monster-card">
                            <div class="card-body">

                                <div class="text-center" each={atk in mon.attacks}>
                                    <div class="row attack-header row-center  {atk.element}">
                                        <div>{atk.name}</div>
                                        <div>{atk.element}<img class="attack-image" src="{atk.image}"></div>
                                    </div>
                                    <div class="row-center">{atk.description}</div>


                                </div>






                            </div>
                            <!-- back content -->
                        </div>
                    </div>
                    <!-- End Card Flip -->
                </div>
            </div>
        </div>
    </div>
    <script>
        var self = this;
        self.mon = self.opts.mon
        console.log(self.mon)
        self.picked = self.mon.picked
        console.log(self.picked)
        self.flipped = false;

        self.flipme = function(){
            console.log(self.mon.attack)
            self.flipped = !self.flipped
            console.log(self.flipped)
        }

        self.pick_monster = function(){
          CLIENT.api.pick_monster(self.mon.id)
          .done(function(mon){
            console.log(mon)
            self.picked = mon.picked
          })
          .fail(function(error){
            console.log(error)
            alert(error.responseJSON)
          })
          .always(function(){
            self.update()
          })

        }



    </script>
    <style>
        .card-footer {
            position: relative;
            width: 100%;
            bottom: 0px;
        }
        .logo {
            position: relative;
            top: 2px;
            left: 5px;
        }

        .card-body {
            background-color: rgba(0,0,0,.03);
        }

        .button-row{
            background-color: rgba(0,0,0,.03);
            width: 100%;
            margin-left: 0px;
        }






        .h-divider{
            margin-top:5px;
            margin-bottom:10px;
            height:1px;
            width:100%;
            border-top:1px solid #000000;
        }

        .card-flip,
        .front,
        .back {
            perspective: 1000px;
            width: 300px;
            height: 560px;
            transition: 0.6s;
        }

        .monster-card {
            height: 500px;
            margin-top: 1em;
        }

        .monster-flip {
            transform: rotateY(180deg);
            transform-style: preserve-3d;
            position: relative;

        }


        .front,
        .back {
            backface-visibility: hidden;
            position: absolute;
            top: 0;
            left: 0;

        }

        .front {
            z-index: 2;
            transform: rotateY(0deg);


        }

        .back {
            transform: rotateY(180deg);

        }

        .Arcane {
            background-color: edb0fc;
        }

        .Light {
            background-color: f9fccf;
        }

        .Air {
            background-color: b3fcef;
        }

        .Water{
            background-color: aadaff;
        }

        .Fire{
            background-color: ffcfbc;
        }

        .Dark{
           background-color: a8a8a8;
        }

        .Earth{
            background-color: b6ffaf;
        }

        .Normal{
           background-color: ffaacb;
        }

        .text-center:first-child div{
          border-radius: 3px 3px 0px 0px;
        }

        .attack-header{
            /*background-color: grey;*/
            display: block;
            margin: 0px -21px 0px -21px;
        }

        .row-center{
            position: relative;
            top: -21px;
            height: 62px;
        }

        .attack-image{
            position: relative;
            top: 3px;
            left: 10px;
        }
    </style>

</monster>
