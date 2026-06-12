import armas.*



class Gladiador{
    var vida = 100

    method vida() = vida

    method atacar(unGladiador){
        const daño = self.poderDeAtaque() - unGladiador.defensa()
        unGladiador.perderVida(daño)
    }

    method perderVida(unaCantidad) {
        vida -= unaCantidad
    }

    method pelearCon(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }
    
    method destreza()
    method defensa()
    method poderDeAtaque()

    method curar(){
        vida = 100
    }

}

class Mirmillon inherits Gladiador{
    var arma
    var armadura
    var fuerza

    method fuerza() = fuerza

    method cambiarFuerza(unaCantidad) {
        fuerza == unaCantidad
    }

    override method destreza() = 15

    method cambiarArmadura(unaArmadura) {
        armadura == unaArmadura
    }

    method cambiarArma(unaArma) {
        arma == unaArma
    }

    override method defensa() = armadura.defensa(self) + self.destreza()

    override method poderDeAtaque() = fuerza + arma.ataque()

    method crearGrupoCon(unGladiador) {
        return new Grupo(
            nombreGrupo="Mirmillolandia", 
            miembros=#{self, unGladiador}
            )
    }

}


class Dimachaerus inherits Gladiador{
    const armas = []
    var destreza 

    method fuerza() = 10

    override method atacar(unGladiador){
        super(unGladiador)
        destreza += 1
    }

    method agregarArma(unArma) {
        armas.add(unArma)
    }

    override method destreza() = destreza

    override method defensa() = destreza / 2

    override method poderDeAtaque() = self.fuerza() + armas.sum({a => a.ataque()})

    method crearGrupoCon(unGladiador) {
        return new Grupo(
            nombreGrupo="D-"+ (self.poderDeAtaque() + unGladiador.poderDeAtaque()).toString(),   //El toString()funciona para definir que sea si o si string el tipo de dato
            miembros=#{self, unGladiador})
    }

}

class Grupo{
    const property nombreGrupo
    const miembros = #{}
    var cantidadDePeleas = 0

    method agregarMiembro(unGladiador) {
        miembros.add(unGladiador)
    }

    method quitarMiembro(unGladiador) {
        miembros.remove(unGladiador)
    }

    method losQuePuedenCombatir() = miembros.filter({g => g.vida() > 0})

    method campeon() = self.losQuePuedenCombatir().max({g => g.poderDeAtaque()})

    method combatirCon(unGrupo) {
        3.times({i => self.campeon().pelearCon(unGrupo.campeon())})   //Esto es como repetir 3 veces la accion que quiero. Si o si va con esa sintaxis.
        cantidadDePeleas += 1
    }

}

