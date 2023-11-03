class Avo::Cards::MetricFromParam < Avo::Cards::MetricCard
  self.id = "metric_from_param"
  self.label = "Metric from param"

  def query
    result params[:metric] || current_user&.id || 101
  end
end
