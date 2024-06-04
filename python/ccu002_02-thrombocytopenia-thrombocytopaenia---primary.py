# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"87902006","system":"snomedct"},{"code":"33183004","system":"snomedct"},{"code":"417626001","system":"snomedct"},{"code":"302873008","system":"snomedct"},{"code":"111588002","system":"snomedct"},{"code":"402654005","system":"snomedct"},{"code":"441511006","system":"snomedct"},{"code":"49341000119108","system":"snomedct"},{"code":"191322006","system":"snomedct"},{"code":"13172003","system":"snomedct"},{"code":"36070007","system":"snomedct"},{"code":"32273002","system":"snomedct"},{"code":"371106008","system":"snomedct"},{"code":"28505005","system":"snomedct"},{"code":"2897005","system":"snomedct"},{"code":"438476003","system":"snomedct"},{"code":"128091003","system":"snomedct"},{"code":"78345002","system":"snomedct"},{"code":"866152006","system":"snomedct"},{"code":"191323001","system":"snomedct"},{"code":"78129009","system":"snomedct"},{"code":"D69.6","system":"snomedct"},{"code":"D69.3","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-thrombocytopenia-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_02-thrombocytopenia-thrombocytopaenia---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_02-thrombocytopenia-thrombocytopaenia---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_02-thrombocytopenia-thrombocytopaenia---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
