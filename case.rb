class Case
  SUSPECTS = [
    "Charles B. Abbage",
    "Donald Duck Knuth",
    "Ada L. Ovelace",
    "Alan T. Uring",
    "Ivar J. Acobson",
    "Ras Mus Ler Dorf"
  ]

  WEAPONS = [
    "Peixeira",
    "DynaTAC 8000X (o primeiro aparelho celular do mundo)",
    "Trezoitão",
    "Trebuchet",
    "Maça",
    "Gládio"
  ]

  PLACES = [
    "Redmond",
    "Palo Alto",
    "San Francisco",
    "Tokio",
    "Restaurante no Fim do Universo",
    "São Paulo",
    "Cupertino",
    "Helsinki",
    "Maida Vale",
    "Toronto"
  ]

  attr_accessor :guilty, :used_weapon, :place

  def initialize(guilty=nil, used_weapon=nil, place=nil)
    @guilty = guilty || Random.rand(1..SUSPECTS.length)
    @used_weapon = used_weapon || Random.rand(1..WEAPONS.length)
    @place = place || Random.rand(1..PLACES.length)
  end


end
