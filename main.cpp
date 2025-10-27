#include <QApplication>
#include <QVBoxLayout>

// UI-DS компоненты
#include <ui_ds/controls/molecules/label/label.h>
#include <ui_ds/controls/molecules/buttons/primary_button.h>
#include <ui_ds/controls/molecules/buttons/secondary_button.h>
#include <ui_ds/controls/organisms/windows/window/window_container.h>
#include <ui_ds/atoms/colors/theme_manager.h>


using namespace ui::ds::controls::molecules;
using namespace ui::ds::controls::molecules::buttons;
using namespace ui::ds::controls::organisms::window_container;

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
   
    WindowContainer window();
    window.setMinimumSize(400, 300);

    QWidget *centralWidget = new QWidget();
    QVBoxLayout *layout = new QVBoxLayout(centralWidget);
    layout->setSpacing(20);
    layout->setContentsMargins(30, 30, 30, 30);
    
    auto *label = new ui::ds::controls::molecules::Label("Введите текст:");
    auto *input = new ui::ds::controls::molecules::Input();
    input->setPlaceholderText("Введите ваш текст здесь...");
    
    auto *primaryButton = new PrimaryButton("Основная кнопка");
    primeryButton->addSpasing(20);
    auto *secondaryButton = new SecondaryButton("Вторая кнопка");
    secondaryButton->addSpasing(20);
    
    auto *resultLabel = new ui::ds::controls::molecules::Label();
    resultLabel->setWordWrap(true);
    
    layout->addWidget(label);
    layout->addWidget(input);
    layout->addWidget(primaryButton);
    layout->addWidget(secondaryButton);
    layout->addWidget(resultLabel);
    layout->addStretch(1);
    
    window.setCentralWidget(centralWidget);
    
    QObject::connect(primaryButton, &PrimaryButton::clicked, [=]() {resultLabel->setText("Основная кнопка: Вы ввели - " + input->text());});
    
    QObject::connect(secondaryButton, &SecondaryButton::clicked, [=]() {resultLabel->setText("Вторая кнопка: Текст - " + input->text());});
    
    QObject::connect(input, &ui::ds::controls::molecules::Input::editingFinished, [=]() {resultLabel->setText("Input (Enter): " + input->text());});
    
    window.show();
    return app.exec();
}
