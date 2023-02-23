build:
run-p1:
    matlab -batch "TestGPPS"
run-p2:
    matlab -batch "TestHouseholder"
run-best:
    matlab -batch "TestGaussSeidel"
pack:
    zip -r ana_maria.mirza.zip ./*
