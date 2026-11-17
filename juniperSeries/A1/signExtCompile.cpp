#include <cstdlib>

int main() {
    system("iverilog -o signExt signExtender.v signExtenderTB.v | ./signExt");
    return 0;
}