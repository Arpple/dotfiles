function v
    while not nvim

        echo "restarting nvim..."

    end
end

# typing v to start nvim;
# if neovim quits normally then `not nvim` == false,
# hence break the loop;
# if neovim quits with :cq, then `not nvim` == true,
# hence restart neovim.
