#include "crow.h"

int main()
{
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        crow::response res;
        res.set_static_file_info("static/index.html");
        return res;
    });

    app.port(18080).run();
}
