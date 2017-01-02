#include <iostream>
#include <future>
#include <chrono>
#include "common.h"
#include "text_ui.h"
#include "cpu.h"
#include "command.h"
#include "plasma.h"

/**
 * Main function
 * @param  argc Number of arguments
 * @param  argv Array of arguments
 * @return      0 on success, 1 otherwise
 */
int main(int argc, char const *argv[]) {

    /* Variable declarations */
    auto exit_signal = false;

    /* Create a simple text-based UI */
    UI* ui = new TextUI();

    /* Create a Plasma CPU */
    CPU* plasma_CPU = new Plasma(ui);

    std::future<Command*> ui_command;

    /* Start listening for commands from the UI */

    ui_command = std::async(std::launch::async, &UI::get_command, ui, plasma_CPU);
    /* Main loop */
    do
    {
        try
        {
            /* Check if user has sent a command through the UI, non-blocking */
            if (ui_command.wait_for(std::chrono::seconds(0)) == std::future_status::ready)
            {
                Command* command = ui_command.get();
                std::cout << "message recv:" << command-> get_type() << std::endl;
                if (command != nullptr) // Something went very very wrong
                {
                    command->execute();
                    ui_command = std::async(std::launch::async, &UI::get_command, ui, plasma_CPU);
                }
                else
                {
                    std::terminate();
                }
            }
        }

        catch (std::exception& e)
        {
            std::cout << "UI ERROR: " << e.what() << std::endl << "Exiting" << std::endl;
            break;
        }

    } while (! exit_signal);

    return 0;
}
