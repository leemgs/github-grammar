
Doxygen: Generate documentation from source code
=================================================

Doxygen is the de facto regular tool for generating documentation from annotated C++ sources, however, it additionally supports different well-known programming languages akin to C, objective-C, C#, Hypertext Preprocessor, Java, Python, IDL (Corba, Microsoft, and UNO/OpenOffice flavors), Fortran, VHDL and Tcl.

Install doxygen & graphviz
-----------------------------
* If you want to run [Doxygen](http://www.stack.nl/~dimitri/doxygen/) to
  produce documentation from your code comments, then in addition do the following:
  * Install [Doxygen](http://www.stack.nl/~dimitri/doxygen/) using the
    instructions on its web site. For reference, The LLVM web site is using Doxygen 1.7.6.1
    however the 1.8 series added support for Markdown formatting. We would like
    to use Markdown in our comments ASAP, so use the latest version of Doxygen.
    ```
    $ sudo apt-get install doxygen
    ```
  * Install [graphviz](http://graphviz.org/) using instructions on their
    site. The current version no longer modifies your path, so you should
    manually modify your path so that it includes "dot".
    ```
    $ sudo apt-get install graphviz
    ```

How to generate documentation from source code
-----------------------------------------------
* Three parts are documented with doxygen: `compiler`, `ncp` and `ci`
* If you want to automatically generate documentation from source code in Linux by using doxygen, proceed as follows:

    ```
    # below are in relative of <git_repository> folder
    $ cd ./<git_repository>

    # for compiler
    $ cd ./compiler
    $ doxygen ../Doxyfile.compiler

    # for FS
    $ cd ./ncp
    $ doxygen ../Doxyfile.ncp

    # for ci
    $ cd ./ci
    $ doxygen ../Doxyfile.ci

    # launch with the browser to view the results
    $ chromium-browser ./html/index.html
    $ firefox ./html/index.html
    ```

How to comment
--------------------
***Comments for Files***

Each file needs to begin with the `@file` command stating the name of the file. This should be followed by a brief description of the file using the `@brief` command. If necessary, you can follow this with a more detailed description. Next you should put your name and andrew id, along with your partners name and andrew id, using the `@author` tag. This needs to be followed with a bugs section with a list of known bugs using the `@bug` command. If there are no known bugs, explicitly state that using the `@bug` command.

***Comments for Functions and Data Structures***

Before each function, data structure, and macro you should put a comment block giving at least a brief description using the `@brief` command. A brief description will suffice for your data structures but for your macros and functions you will need to use a few more commands. After your description, you should use the `@param` command to describe all of the parameters to your function. These descriptions should be followed by a description of the return value using the `@return` command. Note: When we say "each" function, that is not a strong statement. You can leave out simple helper functions, like a max() macro, so you do not waste time.

***Case study***

```bash
/** @file    mysource.c
 *  @brief   A core engine of my source.
 *
 *  These empty function definitions are provided
 *  so that stdio will build without complaining.
 *  You will need to fill these functions in. This
 *  is the implementation of the my source code.
 *  Important details about its implementation
 *  should go in these comments.
 *
 *  @date    1 Jun 2017
 *  @param   [in] repeat number of times to do nothing
 *  @param   [out] repeat number of times to do nothing 
 *  @retval  TRUE Successfully did nothing.
 *  @retval  FALSE Oops, did something.
 *  @bug     No know bugs.
 *  @todo    Make it do something.
 *  @see     http://github.sec.samsung.com/RS7-STAR
 *
 *  Example Usage:
 *  @code
 *    example_mycall(3); // Do nothing 3 times.
 *  @endcode
 */
```
Please, refer to http://www.stack.nl/~dimitri/doxygen/manual/commands.html for more details.

How to generate bash scripts
-----------------------------
Refer to https://github.com/Anvil/bash-doxygen
Doxygen does not support bash script files by default. Edit below lines in a Doxyfile.ci.

```bash
$ vi ./Doxyfile.ci
FILE_PATTERNS = *.sh *.awk
INPUT_FILTER = "sed -e 's|##|//!|'"
FILTER_SOURCE_FILES = YES
```

Then, add a brief description to the top of each script file:
```bash
## @file pr-worker.php
## @brief function for Continuous Integration (CI)
```

References
-----------
  * Getting started: http://www.stack.nl/~dimitri/doxygen/manual/starting.html
  * Case study (Linux kernel): https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/sched/core.c?h=v4.13-rc1#n4454
