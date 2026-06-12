class ArmaDeFilo {
    const longitud
    const filo

    method ataque() = filo * longitud

}


class ArmaContundentes{
    const peso

    method ataque() = peso

}

object casco {
    method defensa(unLuchador) = 10
}

object escudo {
    method defensa(unLuchador) = 5 + unLuchador.destreza() *0.1
}