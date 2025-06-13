function CreateAndMove(param)
    -- Save the current working directory
    local current_directory = vim.fn.getcwd()

    local filename = vim.fn.expand('./main.cpp')

    -- Change the current working directory to the directory of the current buffer
    vim.cmd(':lcd %:p:h')

    -- Generate a message with filename, date, time, and author's name
    local message = string.format(
        "/*\n\tFile: %s\n\tDate and Time Created: %s\n\tAuthor: Rahul M. Navneeth\n*/\n",
        param,
        os.date("%Y-%m-%d %H:%M:%S")
    )

    -- Read the existing content of the current file
    local existing_content = vim.fn.join(vim.fn.readfile(filename), '\n')

    -- Concatenate the message and existing content
    local new_content = message .. "\n" .. existing_content

    -- Write the new content to the file
    vim.fn.writefile(vim.fn.split(new_content, '\n'), param)

    -- Edit the file
    vim.cmd(':e ' .. param)

    vim.cmd(':normal! ' .. 87 + 6 .. 'G')

    -- Restore the original working directory
    vim.cmd(':lcd ' .. current_directory)
end

vim.cmd('command! -nargs=1 C lua CreateAndMove(<f-args>)')
