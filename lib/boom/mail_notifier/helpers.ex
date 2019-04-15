defmodule Boom.MailNotifier.Helpers do
  def exception_basic_text(exception_name, controller, action) do
    "#{module_bare_name(exception_name)} occurred while the request was processed by #{
      module_bare_name(controller)
    }##{action}"
  end

  defp module_bare_name(module) when is_atom(module) do
    Atom.to_string(module)
    |> extract_nested
  end

  defp module_bare_name(module) do
    extract_nested(module)
  end

  defp extract_nested(name) do
    name
    |> String.split(".")
    |> Enum.reverse()
    |> List.first()
  end
end
