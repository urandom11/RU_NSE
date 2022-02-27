# RU_NSE

`python3 masscan_xml_parser.py -f results/xaa.xml -pw`

A curated list of relevant open TCP/UDP ports discovered against RU (Russian Federation) IP blocks. The scan is performed by using a `masscan` tool for a number of network ports like FTP, SSH, SMTP, RDP and some others. This repo is being constantly updated with new discovered machines.

Have look at `results/` folder, it contains `*.bin`, `*.xml` and/or `*.txt` files, whichever format you prefer you can use as those files contain the same data.

Even more, `bin` files could be opened or converted converted by using `masscan` itself like:

```
# Read a binary output and writes it to the console
masscan --readscan bin-test.scan
# Read a binary scan and convert it to another format
masscan --readscan bin-test.scan -oX bin-test.xml
```

