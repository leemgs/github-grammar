# Coding Convention
## C/C++ : clang-format (https://clang.llvm.org/docs/ClangFormat.html)
We use clang-format with 2 indentation to maintain coding convention.
clang-format support VIM and EMACS editor. Even 2 is the default indentation,
you can change the it in $(HOME)/.clang-format file. The below coding
standards is derived from the LLVM style.

We are using clang-format-3.9, because current .clang-format is based on 3.9.
```bash
$ cd .../<your-repository>/
$ sudo apt-get install clang-format-3.9
$ clang-format --help
```

If you want to format multiple file types using a config file, you can run as following:
```bash
$ clang-format -i *.cpp *.h *.hpp
```

Please, refer to http://releases.llvm.org/3.9.0/tools/clang/docs/ClangFormatStyleOptions.html for more details.

## Python

**Formatter yapf (https://github.com/google/yapf)**

We use yapf as a formatter for python files.
It changes the python files according to the defined style in ~/.config/yapf/style file.
we use pep 8. We use style config as below. You can use yapf with PIP.

```bash
$ sudo pip install --proxy=http://10.112.1.184:8080 yapf
$ vi ~/.config/yapf/style
[style]
based\_on\_style = pep8
indent\_width = 4
split\_before\_logical\_operator = true
$ yapf -i *.py
```

**Checker pylint (https://www.pylint.org)**

Pylint is a source code, bug and quality checker for the Python programming language. It follows the style recommended by PEP 8, the Python style guide.
To check a python file with pylint:
```bash
$ sudo pip install --proxy=http://10.112.1.184:8080 pylint
$ cd .../<your-repository>/ ; cp ./.pylintrc ~/
$ pylint your_file.py
Then, modify incorrect statements that are checked by pylint.
```

## PHP: PHP_Beautifier (https://github.com/clbustos/PHP_Beautifier)
This program reformat and beautify PHP 4 and PHP 5 source code files automatically. It is written in PHP 5 and has a command line tool

```bash
$ sudo apt-get install php-pear
$ sudo pear install PHP_Beautifier-0.1.15
```
