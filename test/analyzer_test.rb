# encoding: utf-8
require "test_helper"

class AnalyzerTest < MiniTest::Unit::TestCase
  def setup
    @a = "El gato come pescado y bebe agua."
    @b = "Yo bajo con el hombre bajo a tocar el bajo bajo la escalera."
    @c = "Mi amigo Juan Mesa se mesa la barba al lado de la mesa."
  end

  def test_token_attributes
    skip

    expected_token = { form: "El", lemma: "el", prob: 1, tag: "DA0MS0" }

    analyzer = FreeLing::Analyzer.new(@a, :language => :es)
    token = analyzer.tokens.first

    [:form, :lemma, :prob, :tag].each do |key|
      assert_equal expected_token[key], token[key]
    end
  end

  def test_token_list
    skip

    expected_tokens = [
      { form: "El", lemma: "el", prob: 1, tag: "DA0MS0" },
      { form: "gato", lemma: "gato", prob: 1, tag: "NCMS000" },
      { form: "come", lemma: "comer", prob: 0.75, tag: "VMIP3S0" },
      { form: "pescado", lemma: "pescado", prob: 0.833333, tag: "NCMS000" },
      { form: "y", lemma: "y", prob: 0.999812, tag: "CC" },
      { form: "bebe", lemma: "beber", prob: 0.994868, tag: "VMIP3S0" },
      { form: "agua", lemma: "agua", prob: 0.973333, tag: "NCCS000" },
      { form: ".", lemma: ".", prob: 1, tag: "Fp" },
    ]

    analyzer = FreeLing::Analyzer.new(@a, :language => :es)
    analyzer.tokens.each.with_index do |token, i|
      [:form, :lemma, :prob, :tag].each do |key|
        assert_equal expected_tokens[i][key], token[key]
      end
    end
  end
end
