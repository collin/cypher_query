defmodule CypherQueryTest do
  use ExUnit.Case
  import CypherQuery

  test "builds a query" do
    assert compile(builder) == ""
  end

  test "matches nodes" do
    assert compile(builder match: '(node)') == "MATCH (node)"
  end

  test "matches and returns nodes" do
    assert compile(builder match: '(node)', return: 'node') == "MATCH (node) RETURN node"
  end

  test "combines queries" do
    q1 = builder match: '(n1)', return: 'n1'
    q2 = builder match: '(n2)', return: 'n2'

    cypher = compile combine [q1, q2]

    assert cypher == "MATCH (n1), (n2) RETURN n1, n2"
  end

  test "filters nodes with WHERE" do
    assert compile(builder where: 'n.a == true', where: 'n.b <> 88') == "WHERE (n.a == true AND n.b <> 88)"
  end
end
