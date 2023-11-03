class Avo::Cards::MapCard < Avo::Cards::PartialCard
  self.id = "map_card"
  self.label = "Map card"
  self.partial = "avo/cards/map_card"
  self.display_header = false
  self.cols = 3
  self.rows = 4
end
