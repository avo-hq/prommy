class Avo::Scopes::EvenId < Avo::Pro::Scopes::BaseScope
  self.name = "Even"
  self.description = "tooltip ;)"
  self.scope = -> { query.where("#{resource.model_key}.id % 2 = ?", "0") }
  self.visible = -> { true }
end
