
class PassThroughParams
  def self.run(base_params, params)
    flagged_params = [
      :hb,
      :p,
      :uref,
      :ft,
      :r,
      :exp,
      :sig,
      :gen
    ]

    flagged_params.each do |passed_param|
      current_param = params[passed_param]
      next unless current_param.present?
      base_params[passed_param] = current_param
    end

    base_params
  end
end
