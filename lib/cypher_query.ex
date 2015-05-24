defmodule CypherQuery do
  def compile(nil), do: ""
  def compile(options) do
    cypher = []
    if options[:match], do: cypher = cypher ++ ["MATCH #{join_values options, :match}"]
    if options[:where], do: cypher = cypher ++ ["WHERE (#{join_values options, :where, " AND "})"]
    if options[:return], do: cypher = cypher ++ ["RETURN #{join_values options, :return}"]
    if options[:limit], do: cypher = cypher ++ ["LIMIT #{get_value options, :limit}"]
    Enum.join cypher, " "
  end

  defp join_values(options, key, joiner \\ ", ") do
    Enum.join Keyword.get_values(options, key), joiner
  end

  defp get_value(options, key), do: Enum.at(Keyword.get_values(options, key), 0)

  def builder, do: nil
  def builder(options), do: options

  def combine([], options), do: options
  def combine([head | tail], options), do: combine(tail, options ++ head)
  def combine([head | tail]), do: combine([head|tail], [])
end
