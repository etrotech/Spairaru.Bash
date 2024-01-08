# [spairaru.bash](http://www.spairaru.com)

![Stability-Beta](https://img.shields.io/badge/stability-beta-lightgrey.svg)
![Release](https://img.shields.io/github/release/franciscolourenco/done.svg?color=lightgray)
![Requirement-Bash-4.0.](https://img.shields.io/badge/bash-%3E=4.0.-lightgrey.svg)
[![Licence-MIT](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/micah0912/M/blob/master/LICENSE)

- Its baselayer framework for easy and rapid application development.
- Licensed by [@EtroTech](https://github.com/etrotech) under [MIT](https://github.com/micah0912/M/blob/master/LICENSE).
- Collaboration or service request, contact [@us](https://github.com/etrotech).
- A coffee donation will help to keep the package updated :)

<tab>
<br>

### Highlights
---
- Aim to enhance better management and scalability of `Bash` projects.
- Useful and Powerful readable syntax.
- All languages, one flow.

<tab>
<br>

### Family
---

Each vibrant **spairaru**, seeks to vortec up amidst diverse realms.  

<br>

<u>As December,2023</u>

| Language | C++ | Bash | Java | Js  | Ts  | Py  | Php | Swift |
| -------- | --- | ---- | ---- | --- | --- | --- | --- | ----- |
| Progress | ◔   | ✓    | ∗    | ◕   | ◕   | ✓   | ◑   | ◔     |

- *on-progress* : 0-25 ◔ , 25-50 ◑ , 50 - 75 ◕
- *provisioned* : ∗
- *released* : ✓

<tab>
<br>

### Requirements
---

1. [Bath](https://www.gnu.org/software/bash/) version 4.0.+

<tab>
<br>

### Installation
---

**Method A : Installation Script**

```bash

curl https://raw.githubusercontent.com/etrotech/spairaru.bash/master/__installers__/install.sh | sudo sh

```
```bash

wget -O - https://raw.githubusercontent.com/etrotech/spairaru.bash/master/__installers__/install.sh | sudo sh

```
<tab>
<br>

**Method B : Repository**

```bash

* coming soon.

```
<tab>
<br>

**Method C : Manually**
1. download from [Git](https://github.com/micah0912/M) or [Archive](http://www.spairaru.com).
2. extra and move `spairaru.bash` folder from either `src` source folder or `dist` distribution folder to preferred location; Default path is `/opt/EtroTech spairaru.bash`.
4. then execute install command.

```bash

bash +x __path_of_spairaru.bash_folder__/spairaru.sh install

# please replace __path_of_spairaru.bash_folder__ with real path.

```
<tab>  
<br>

### FileSytem Map
---

**Package**

```

📦
└─ 🖿 opt
   └─ 🖿 EtroTech spairaru.bash
	  └─ 🖺 spairaru.sh

```

**Configuration**

```

🛠️
├─ 🖿 etc
│  └─ 🖿 EtroTech spairaru.bash
│     ├─ 🖺 *.env
│     ├─ 🖺 s.ini
│     └─ 🖺 *.ini
├─ 🖿 $HOME
│  └─ 🖿 .s.bash
│     ├─ 🖺 *.env
│     ├─ 🖺 s.ini
?     └─ 🖺 *.ini
└─ 🖿 $PWD
   └─ 🖿 .s.bash
      ├─ 🖺 *.env
      ├─ 🖺 s.ini
      └─ 🖺 *.ini

```

**Runtime**

```

📄
└─ 🖿 var
   └─ 🖿 log
	  └─ 🖿 EtroTech spairaru.bash

```

**Temporary**

```

🗑️
└─ 🖿 tmp
   └─ 🖿 EtroTech spairaru.bash

```
<tab>  
<br>

### Precaution
---

Due to Bash's nature, its hard to manage scopes, environmental variables and etc for big projects. When utilize `spairaru.bash` in script, <u>to avoid unnecessary duplication of sourcing and computing</u>, please preload on start.

<details>
<summary>long syntax</summary>
</details>

```bash

source `spairaru path` preload 

```

<details>
<summary>short syntax</summary>
</details>

```bash

. `s pf` prld 

```

<tab>  
<br>

### Examples
---

**1 : Advanced Argument Handler** 

In shell language function only handler positioned arguments, or supply <u>dash prefixed</u> argument to utilities such like `getopts` for optional labeling; which ask users to pass argument in <u>Named Argument Ahead Style</u>.

*Named Argument Ahead Style*

```bash

# pa__ : positional argument
# na : named argument

Foo \
	--na1 \
	--na2 __option_value__ \
	-- \
	pa1__ \
	pa2__ \
;

```

*Positional Argument Ahead Style*

```bash

# pa__ : positional argument
# na : named argument

Foo \
	pa1__ \
	pa2__ \
	--na1 \
	--na2 __option_value__ \
;

```

With **spairaru.bash**, now unlocks <u>Positional Argument Ahead Style</u> which many high programing languages use; the same time, handler both ways depends on end users' preference.

<details>
<summary>long syntax</summary>

```bash

Foo() {

	# store arguments into  a mandate variable.
	# * this is the special variable for callable utility group. 
	# * if this variable is not named in _ax you need to assign on call time.
	# * for this case is "-- _arguments" .
	local _arguments=("$@") ;


	# get positioned arguments to an array.
	declare -a _positioned_arguments=` \
		spairaru callable gtPositionedArguments \
			-- _arguments \
	` ;

	# print out.
	for index in ${!_positioned_arguments[@]} ;
	do

		echo "${index}      : ${_positioned_arguments[$index]}" ;

	done ;


	# get named arguments to a dictionary.
	declare -A _named_arguments=` \
		spairaru callable gtNamedArguments \
			--label1 "alias_name" \
			--label2 \
			--label3 \
			--label3-number_of_value 1 \
			--label4 \
			--label4-number_of_value 1 \
			--label4-default xyz \
			-- _arguments \
	` ;

	# print out.
	for key in ${!_named_arguments[@]} ;
	do

		echo "${key} : ${_named_arguments[$key]}" ;

	done ;

}


Foo \
	abcd \
	efgh \
	--alias_name \
	--label3 uvw \
;


# Expected output --------
# 1      : abcd
# 2      : efgh
# label1 : 0
# label2 : 1
# label3 : uvw
# label4 : xyz

```

</details>

<details>
<summary>short syntax</summary>

```bash 

Foo() {

	# store arguments into a mandate variable.
	local _ax=("$@") ;


	# get positioned arguments to an array.
	declare -a _pax=`s cbl pax` ;

	# print out.
	for i in ${!_pax[@]} ;
	do

		echo "${i}    : ${_pax[$i]}" ;

	done ;


	# get named arguments to a dictionary.
	declare -A _nax=` \
		s cbl nax \
			--lbl1 "Aka" \
			--lbl2 \
			--lbl3 \
			--lbl3-nov 1 \
			--lbl4 \
			--lbl4-nov 1 \
			--lbl4-dflt xyz \
	` ;

	# print out.
	for ky in ${!_nax[@]} ;
	do

		echo "${ky} : ${_nax[$ky]}" ;

	done ;

}


Foo \
	abcd \
	efgh \
	--Aka \
	--lbl3 uvw \
;


# Expected output --------
# 1    : abcd
# 2    : efgh
# lbl1 : 0
# lbl2 : 1
# lbl3 : uvw
# lbl4 : xyz

```

</details>

<br>

**2 : Prompt Ready to Go** 

**<u>Questionary</u>**

<details>
<summary>long syntax</summary>

```bash

declare hero ;

spairaru prompt ask \
	"Which hero you like the most?" \
	--answer hero \
	--option a "Super Man" \
	--option b "Bat Man" \
	--option c "Spider Man" \
;

echo $hero ;

```

</details>

<details>
<summary>short syntax</summary>

```bash

declare hero ;

s ppt ask \
	"Which hero you like the most?" \
	--ans hero \
	--opt a "Super Man" \
	--opt b "Bat Man" \
	--opt c "Spider Man" \
;

echo $hero ;

```

</details>

<br>

**<u>Acquire User Input</u>**

<details>
<summary>long syntax</summary>

```bash

declare name ;

spairaru prompt ask \
	"What is your name?" \
	--answer name \
	--type input \
;

echo $name ;

```

</details>

<details>
<summary>short syntax</summary>

```bash

declare nm ;

s ppt ask \
	"What is your name?" \
	--ans name \
	--type ipu \
;

echo $nm ;

```

</details>


<br>

**3 : Advanced Glob Syntax**

In shell default glob cannot match detailed pattern, or `find` command require you to split conditions to arguments. **spairaru.bash** will empower you to use glob syntax like high-level languages do.

Assume we have directory like below.

```

🖿 root
└─ 🖿 A
   ├─ 🖿 B
   │  └─ 🖿 D
   │     ├─ 🖺 E-1
   │     ├─ 🖺 E-2
   │     └─ 🖺 E-3
   ├─ 🖺 C-1
   ├─ 🖺 C-2
   └─ 🖺 C-3

```

<details>
<summary>long syntax</summary>

```bash

spairaru filesystem glob \
	'/root/*/*/*/*' \
;

# /root/A/B/D/E-1
# /root/A/B/D/E-2
# /root/A/B/D/E-3

spairaru filesystem glob \
	'/root/**/*1' \
;

# /root/A/B/D/E-1
# /root/A/C-1

spairaru filesystem glob \
	'/root/*/*{1,2}' \
;

# /root/A/C-1
# /root/A/C-2

```

</details>

<details>
<summary>short syntax</summary>

```bash

s fs gl \
	'/root/*/*/*/*' \
;

# /root/A/B/D/E-1
# /root/A/B/D/E-2
# /root/A/B/D/E-3

s fs gl \
	'/root/**/*1' \
;

# /root/A/B/D/E-1
# /root/A/C-1

s fs gl \
	'/root/*/*{1,2}' \
;

# /root/A/C-1
# /root/A/C-2

```

</details>

<br>

For more documentation and examples please visit [website](http://www.spairaru.com).

<tab>
<br>

### Maintenance 
---
**Spairaru** family is managed by [@EtroTech](https://github.com/etrotech), and its contributors. 

<tab>
<br>

### Support
---

If you feel **spairaru.bash** useful and helpful, please help us to make it better.

<br>

<p style="float: left;">
	<a href="https://paypal.me/micaht0912" target="_blank"><img src="https://raw.githubusercontent.com/micah0912/M/master/__readme__/ast/m-paypal.jpg" alt="Paypal" style="width: 24%; "></a>
	<a href="" target="_blank"><img src="https://raw.githubusercontent.com/micah0912/M/master/__readme__/ast/m-alipay.jpg" alt="Alipay" style=" width: 24%;"></a>
	<a href="" target="_blank"><img src="https://raw.githubusercontent.com/micah0912/M/master/__readme__/ast/m-wechat.jpg" alt="Wechat" style="width: 24%;"></a>
</p>

<br>
