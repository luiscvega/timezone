require "cuba"
require "json"

require_relative "lib/helpers"

require_relative "lib/query"
require_relative "lib/timezone"

Cuba.plugin Helpers

Cuba.define do
  on "api" do
    query = Query.new(
      "year"   => req.params["year"],
      "month"  => req.params["month"],
      "day"    => req.params["day"],
      "hour"   => req.params["hour"],
      "minute" => req.params["minute"],
      "second" => req.params["second"],
      "from"   => req.params["from"],
      "to"     => req.params["to"]
    )

    res["Content-Type"] = "application/json"

    res.write(JSON.pretty_generate(query.convert))
  end
end
