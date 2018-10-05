#include "lib.h"

#include <spdlog/spdlog.h>
#include <iostream>
int main()
{
   // auto logger = spdlog::stdout_logger_mt("console");
   // logger->info("build {}", version());
   // logger->info("Hello, World!");
	std::cout << "build " << version()<<std::endl;
	std::cout << "Hello, World!" << std::endl;

    return 0;
}
