defmodule NotifiexTelegram.Bot do
  @bot :sue
  @pretty_debug false

  @behaviour Notifiex.ServiceBehaviour

  require Logger

  defmodule Message do
    @chat_id 41_785_214
    defstruct [:body, attachments: [], chat_id: @chat_id]
  end

  use ExGram.Bot,
    name: @bot

  def bot(), do: @bot

  def handle({:command, command, msg}, context) do
    Logger.debug("=== begin :command handle ===")
    Logger.debug("command: #{command |> inspect(pretty: @pretty_debug)}")
    Logger.debug("msg: #{msg |> inspect(pretty: @pretty_debug)}")
    Logger.debug("context: #{context |> inspect(pretty: @pretty_debug)}")
    Logger.debug("=== end :command handle ===")

    # msg = Message.from_telegram(%{msg: msg, command: command, context: context})
    # Sue.process_messages([msg])
    context
  end

  def handle({:message, msg}, context) do
    Logger.debug("=== begin :message handle ===")
    Logger.debug("msg: #{msg |> inspect(pretty: @pretty_debug)}")
    Logger.debug("context: #{context |> inspect(pretty: @pretty_debug)}")
    Logger.debug("=== end :message handle ===")
    # Logger.info("msg: #{inspect(msg)}\n\ncontext: #{inspect(context)}")
    # msg = Message.from_telegram(%{msg: msg, context: context})
    # Sue.process_messages([msg])
    context
  end

  def handle({:text, _text, _msg}, _context) do
    # Direct text or reply in group
    :ok
  end

  def handle({:update, _update}, _context) do
    # Poll responses
    :ok
  end

  def call(%Message{body: nil, attachments: []}, opts) do
    # Likely already sent custom response (ex: polls)
    :ok
  end

  def call(%Message{attachments: []} = msg, opts) do
    # No attachments
    send_response_text(msg, opts)
  end

  # def call(msg, %Response{body: nil, attachments: atts}) do
  #   # No text
  #   send_response_attachments(msg, atts)
  # end

  # def call(%Message{} = msg, %Response{attachments: atts} = rsp) do
  #   send_response_text(msg, rsp)
  #   send_response_attachments(msg, atts)
  # end

  def send_response_text(msg, _opts) do
    ExGram.send_message(msg.chat_id, msg.body)
    :ok
  end

  # def send_response_attachments(_msg, []), do: :ok

  # def send_response_attachments(msg, [att | atts]) do
  #   {_platform, id} = msg.chat.platform_id
  #   ExGram.send_photo(id, {:file, att.filename})
  #   send_response_attachments(msg, atts)
  # end
end
