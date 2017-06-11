# MIDI Parser Extension for Wire Expression 2

[![MIT License](https://img.shields.io/github/license/garrysmodlua/GMod-Expression2-midi-parser.svg?style=flat-square&maxAge=30)](https://github.com/garrysmodlua/GMod-Expression2-midi-parser/blob/master/LICENSE) [![Travis Build Status](https://img.shields.io/travis/garrysmodlua/GMod-Expression2-midi-parser/master.svg?style=flat-square&maxAge=30)](https://travis-ci.org/garrysmodlua/GMod-Expression2-midi-parser)

**It is not perfect**! Use it for experimental purposes. It is Work-In-Progress (**WIP**)!

## Installation

### Download

1. Download and install [Wire](https://github.com/garrysmodlua/wire) addon.
2. Download the source code, there are 2 ways to do it, use any way you like:  
	* Clone this repository using [git](https://git-scm.com/downloads): `git clone --recursive https://github.com/garrysmodlua/GMod-Expression2-midi-parser.git e2-midi-parser`. Recommended way.
	* Download the latest release from [here](https://github.com/garrysmodlua/GMod-Expression2-midi-parser/releases/latest). Alternative way.
	* ~~Download ZIP of this repository [here](https://github.com/garrysmodlua/GMod-Expression2-midi-parser/archive/master.zip).~~ UNSUPPORTED. Do NOT use this way, it will not work (midiparser module is missing)!

### GMod Setup

1. Navigate to your `./Steam/steamapps/common/GarrysMod/garrysmod/addons` folder.
2. Depending on which download method you have used, make sure you have the following directory structure (create any necessary folder yourself if it doesn't exist):

![Expected directory structure](https://user-images.githubusercontent.com/9789070/27011774-9110082e-4ec3-11e7-99ef-31a3d1e1f847.png)

3. Run the following in (server) Console: `wire_expression2_extension_enable "midiparser"; wire_expression2_reload;`.
4. You are done. Have fun!

## Usage / Code Example

1. Call `number=midiParse(string midiData, table midiResult)` E2 function. Here is a simple E2 code to demonstrate how you would use `midiparser` E2 extension:
	```golo
	@name midiparser example

	local MidiData = "..."           # Replace "..." with the actual MIDI data (plain contents of a '.mid' file).
	local MidiResultTable = table()  # Tell parser to store the result of MIDI data into a table.
	if (midiParse(MidiData, MidiResultTable))
	{
		# Successfully parsed. We print out the resulting table:
		printTable(MidiResultTable)
	}
	else
	{
		# Self-explanatory. MIDI data wasn't parsed because an error occured in parser (check your MIDI is valid and supported format).
		print("An error occurred while parsing MIDI string, please check the input MIDI data is valid/supported!")
	}
	```

	Challenge for you: Make use of [E2 file extension](https://github.com/wiremod/wire/wiki/Expression-2#File_Functions) (use file* E2 functions), and then [implement a chat-command](https://github.com/wiremod/wire/wiki/Expression-2#Chat) to hook it up with `midiParse`, so you can parse `.mid` files from your computer via chat-command. Also, due security reasons, there is no `midiParseFile` E2 function.

### Return Sample

```lua
{
	format = 1,
	timebase = 96,
	tracks = {
		{
			messages = {
				{
					time = 0,
					type = "meta",
					meta = "Time Signature",
					signature = { 4, 2, 24, 8 }
				},
				{
					time = 0,
					type = "meta",
					meta = "End of Track"
				}
			}
		},
		{
			messages = {
				{
					time = 0,
					type = "meta",
					meta = "Set Tempo",
					tempo = 468375
				},
				{
					time = 0,
					type = "meta",
					meta = "End of Track"
				}
			}
		},
		{
			name = "TrackName",
			messages = {
				{
					time = 0,
					type = "meta",
					meta = "Track Name",
					text = "TrackName"
				},
				{
					time = 0,
					type = "on",
					channel = 0,
					number = 48,
					velocity = 100
				},
				{
					time = 96,
					type = "off",
					channel = 0,
					number = 48,
					velocity = 64
				},
				{
					time = 0,
					type = "meta",
					meta = "End of Track"
				}
			}
		}
	}
}
```

## Documentation

Sorry, there is no wiki nor docs...

## Contribution

Visit the [Contributor Guidelines](https://github.com/garrysmodlua/GMod-Expression2-midi-parser/blob/master/.github/CONTRIBUTING.md) for more details. All contributors are expected to follow our [Code of Conduct](https://github.com/garrysmodlua/GMod-Expression2-midi-parser/blob/master/.github/CODE_OF_CONDUCT.md).

## Support

If you think you have found a bug or have a feature/enhancement request for Expression 2 MIDI parser extension, use our [issue tracker](https://github.com/garrysmodlua/GMod-Expression2-midi-parser/issues/new).  

Before opening a new issue, please be kind and search to see if your problem has already been reported. Try to be as detailed as possible in your issue reports.  
When creating an issue, clearly explain  

* What you were trying to do?
* What you expected to happen?
* What actually happened?
* Steps to reproduce the problem.

Also include any other information you think is relevant to reproduce the problem.

## License

[Expression 2 MIDI parser extension](https://github.com/garrysmodlua/GMod-Expression2-midi-parser) repository/code is freely distributed under the [MIT](LICENSE) license. See [LICENSE](LICENSE) for more details.

## Credits

[CaptainPRICE](https://github.com/CaptainPRICE) for developing Expression 2 MIDI parser extension.

## Related Projects

[GLua-midi-parser](https://github.com/garrysmodlua/GLua-midi-parser): GLua MIDI Parser Library.
