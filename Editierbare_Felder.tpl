<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sudoku</title>
    <link rel="stylesheet" href="static/editierbare_felder.css">
</head>
    <div class="headline">
        <h1 font="sans-serif">Sudoku</h1>
    </div>
    <div class="game">
        <form action="/solve" method="POST" name="grid" id="sudoku">
            <div class="rand">
                % counter = 0
                % for x in range (9):
                    % for y in range (9):
                        % counter += 1
                        <div class="normalesdiv sudoku_input {{"rechterrand" if (y+1)%3==0 and (y+1)!=9 else ""}} {{"untererrand" if (x+1)%3==0 and (x+1)!=9 else ""}}">
                            <input class="sudoku_input" name="{{(x*9)+y}}" type= "text" maxlength="1" min="1" max="9" inputmode="numeric"
                            % if grid[x][y] !=0 and str(grid[x][y]).isnumeric():
                                readonly
                                value={{grid[x][y]}}
                                STYLE="color: dimgrey"
                            % elif grid[x][y] !=0:
                                value={{grid[x][y]}}
                                STYLE="color: dimgrey"
                            % end
                            >
                        </div>
                    % end
                % end
            </div>
        </form>
    <div class="knoepfe">
        <a href="/solve"><button name="reset_button" type="submit" form="sudoku">Solve</button></a>
        <a href="/create_example"><button name="reset_button" type="submit">Create Example</button></a>
        <a href="/check"><button name="reset_button" type="submit">Check</button></a>
        <a href="/"><button name="reset_button" type="submit">Clear</button></a>
        <a href="/einmalige_ausfuellung"><button name="name_button" type="submit">Solve a Field</button></a>
    % try:
        % if value_error:
            <p>Only numbers are allowed!</p>
        % end
    % except:
        % pass
    % end
</html>