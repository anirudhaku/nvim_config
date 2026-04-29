return {
  model = "gpt-4.1",
  debug = true, -- Enable debugging
  window = {
    layout = 'vertical',
  },
  functions = {
    gitshow = {
      group = 'copilot',
      uri = 'git://show/{commit}',
      description = 'Retrieves a commit. Requires git to be installed. Useful for discussing code changes or explaining the purpose of modifications.',

      schema = {
        type = 'object',
        required = { 'commit' },
        properties = {
          commit = {
            type = 'string',
            description = 'Commit to show.',
            default = 'HEAD',
          },
        },
      },

      resolve = function(input, source)
        local utils = require("CopilotChat.utils")

        local cmd = {
          'git',
          '-C',
          source.cwd(),
          'show',
          '--no-color',
          '--no-ext-diff',
          input.commit,
        }
        local out = utils.system(cmd)

        return {
          {
            uri = 'git://show/' .. input.commit,
            mimetype = 'text/plain',
            data = out.stdout,
          },
        }
      end,
    },
    gitfiles = {
      group = 'copilot',
      uri = 'git://files/{pattern}',
      description = 'Retrieves all source files that match given pattern in current workspace. Requires git to be installed. Useful for discussing code changes or explaining the purpose of modifications.',

      schema = {
        type = 'object',
        required = { 'pattern' },
        properties = {
          pattern = {
            type = 'string',
            description = 'Pattern to look for in source file names. If matches multiple, all are included.',
            default = 'HEAD',
          },
        },
      },

      resolve = function(input, source)
        local utils = require("CopilotChat.utils")
        local resources = require("CopilotChat.resources")
        utils.schedule_main()

        local git_ls_cmd = {
          'git',
          '-C',
          source.cwd(),
          'ls-files',
          input.pattern,
        }

        local out = utils.system(git_ls_cmd)

        local result = {}
        for _, file in ipairs(vim.split(out.stdout, '\n')) do
          if file ~= '' then
            local full_path = source.cwd() .. '/' .. file
            local data, mimetype = resources.get_file(full_path)
            if not data then
              error('File not found: ' .. full_path)
            end
            table.insert(result, {
              uri = 'file://' .. full_path,
              mimetype = mimetype,
              data = data,
            })
          end
        end
        return result
      end,
    },
  },
}
