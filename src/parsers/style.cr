module Mint
  class Parser
    syntax_error StyleExpectedOpeningBracket
    syntax_error StyleExpectedClosingBracket
    syntax_error StyleExpectedName

    def style : Ast::Style | Nil
      start do |start_position|
        skip unless keyword "style"

        whitespace

        name = variable_with_dashes! StyleExpectedName

        body = block(
          opening_bracket: StyleExpectedOpeningBracket,
          closing_bracket: StyleExpectedClosingBracket
        ) do
          css_body_with_media
        end

        Ast::Style.new(
          from: start_position,
          to: position,
          input: data,
          body: body,
          name: name)
      end
    end

    def css_body_with_media
      many { comment || css_definition || css_media || css_selector }.compact
    end

    def css_body
      many { comment || css_definition || css_selector }.compact
    end
  end
end
