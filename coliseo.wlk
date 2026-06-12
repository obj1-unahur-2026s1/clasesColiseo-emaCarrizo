import gladiadores.*
import armas.*


object coliseo {
    method combatirGrupos(grupo1, grupo2) {
        grupo1.combatirCon(grupo2)
    }

    method combatirConCampeon(unGrupo, unCampeon){
        unGrupo.miembros().forEach({g => g.pelearCon(unCampeon)})
    }

    method curarGladiador(unGladiador) {
        unGladiador.curar()
    }

    method curarGrupo(unGrupo){
        unGrupo.miembros().forEach({g => g.curar(unGrupo)})
    }

}