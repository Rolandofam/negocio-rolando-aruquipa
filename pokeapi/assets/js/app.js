const URL = "https://pokeapi.co";

function buscarPokemon() {
    let idPokemon = document.getElementById("idPokemon").value;
    console.log(idPokemon);
    fetch(`${URL}/api/v2/pokemon/${idPokemon}`)
        .then((response) => {
            if (!response.ok) {
                throw new Error(`HTTP error! Estado: ${response.status}`);
            } else {
                console.log(`Estado: ${response.status}`);
                // console.log(response);
            }
            return response.json();
        })
        .then((data) => {
            // console.log("Exito:", data);
            cardPokemon(data);
            document.getElementById("idPokemon").value = "";
        })
        .catch((error) => {
            // console.log(response.status);
            // console.error("mensaje", error.message);
            let pokemon = document.getElementById("pokemon");
            pokemon.innerHTML = `<div class="card shadow-lg p-3 mb-5 bg-white rounded">
                                    <div class="card-header">
                                        <h3 class="card-title text-center">NO EXISTE EL POKEMON</h3>
                                    </div>
                                </div>`;
        });
}

function cardPokemon(datos) {
    // usuario.clear();
    console.log(`${ datos.name }`);
    console.log(`${datos.sprites.front_default}`);
    let pokemon = document.getElementById("pokemon");
    pokemon.innerHTML = `<div class="card shadow-lg p-3 mb-5 bg-white rounded">
                            <div class="card-header">
                                <h3 class="card-title text-center">${datos.name.toUpperCase()}</h3>
                                <img class="img-fluid"
                                    src="${datos.sprites.other.home.front_default}"
                                    alt="" srcset="">
                                <div class="single_property_description text-center">
                                    <span>Tipo: <strong>${datos.types[0].type.name.toUpperCase()}</strong></span>
                                    <span>Peso: <strong>${(datos.weight * 0.1).toFixed(2)} kg.</strong></span>
                                    <span>Altura: <strong>${(datos.height * 0.1).toFixed(2)} m.</strong></span>
                                </div>
                            </div>
                        </div>`;
}