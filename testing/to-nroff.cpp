
#include<iostream>

int
main()
{
	for (std::string line; std::getline(std::cin, line); )
	{
		std::cout << ".TP" << std::endl <<
		'o' << std::endl <<
		line << std::endl;
	}

	return 0;
}
