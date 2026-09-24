local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("div", fmt("<div class=\"{}\">\n  {}\n</div>", { i(1, "container"), i(0) })),
  s("section", fmt("<section class=\"{}\">\n  {}\n</section>", { i(1, "section"), i(0) })),
  s("link", fmt('<link rel="stylesheet" href="{}">', { i(1, "style.css") })),
  s("img", fmt('<img src="{}" alt="{}">', { i(1, "image.jpg"), i(0, "Alt text") })),
}
