#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include <string> 

int count = 0;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    std::string str = std::to_string(count);
    ui->label->setText(str.c_str());
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    count++;
    std::string str = std::to_string(count);
    ui->label->setText(str.c_str());
}
