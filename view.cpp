#include "view.h"
#include <QCompleter>

MainView::MainView(QWidget *parent) 
    : QWidget(parent)
    , m_input(nullptr)
    , m_primaryButton(nullptr)
    , m_secondaryButton(nullptr)
    , m_resultLabel(nullptr)
    , m_themeComboBox(nullptr)
    , m_colorGroupComboBox(nullptr)
    , m_colorStack(nullptr)
{
    setupUI();
    setupConnections();
    initColorGroups();
}

void MainView::setupUI()
{
    QVBoxLayout *mainLayout = new QVBoxLayout(this);
    mainLayout->setSpacing(20);
    mainLayout->setContentsMargins(30, 30, 30, 30);

    //управлениt темой
    auto *themeSectionLabel = new Label("Управление темой");
    mainLayout->addWidget(themeSectionLabel);

    m_themeComboBox = new Combobox(this);
    m_themeComboBox->addItem("Светлая тема");
    m_themeComboBox->addItem("Темная тема");
    m_themeComboBox->setCurrentIndex(0);
    mainLayout->addWidget(m_themeComboBox);

    //основныe элементs
    auto *elementsSectionLabel = new Label("Основные элементы");
    mainLayout->addWidget(elementsSectionLabel);

    m_input = new Input();
    m_input->setPlaceholderText("Введите ваш текст здесь...");
    mainLayout->addWidget(m_input);

    m_primaryButton = new PrimaryButton("Основная кнопка");
    m_secondaryButton = new SecondaryButton("Вторая кнопка");
    mainLayout->addWidget(m_primaryButton);
    mainLayout->addWidget(m_secondaryButton);

    m_resultLabel = new Label();
    m_resultLabel->setWordWrap(true);
    mainLayout->addWidget(m_resultLabel);

    //выбор цветовой группы
    auto *colorsSectionLabel = new Label("Цвета дизайн-системы");
    mainLayout->addWidget(colorsSectionLabel);

    m_colorGroupComboBox = new Combobox(this);
    m_colorGroupComboBox->addItem("Основные цвета");
    m_colorGroupComboBox->addItem("Альтернативные цвета");
    m_colorGroupComboBox->addItem("Цвета компонентов");
    m_colorGroupComboBox->setEditable(true);
    
    QCompleter *completer = new QCompleter(m_colorGroupComboBox->model(), m_colorGroupComboBox);
    completer->setCaseSensitivity(Qt::CaseInsensitive);
    m_colorGroupComboBox->setCompleter(completer);
    
    mainLayout->addWidget(m_colorGroupComboBox);

    //для отображения цветовых палитр
    m_colorStack = new QStackedWidget(this);
    mainLayout->addWidget(m_colorStack);

    mainLayout->addStretch(1);
}

void MainView::setupConnections()
{
    QObject::connect(m_primaryButton, &PrimaryButton::clicked, [this]() {m_resultLabel->setText("Основная кнопка: Вы ввели - " + m_input->text());});
    QObject::connect(m_secondaryButton, &SecondaryButton::clicked, [this]() {m_resultLabel->setText("Вторая кнопка: Текст - " + m_input->text());});
    QObject::connect(m_input, &Input::editingFinished, [this]() {m_resultLabel->setText("Input (Enter): " + m_input->text());});

    //смена темы
    QObject::connect(m_themeComboBox, QOverload<int>::of(&QComboBox::currentIndexChanged), 
        [this](int index) 
        {
            if (index == 0) 
            {
                qDebug() << "Переключена светлая тема";
            } 
            else 
            {
                qDebug() << "Переключена темная тема";
            }
        });

    //выбор цветовой группы
    QObject::connect(m_colorGroupComboBox, QOverload<int>::of(&QComboBox::currentIndexChanged),[this](int index) 
        {
            if (index >= 0 && index < m_colorStack->count()) 
            {
                m_colorStack->setCurrentIndex(index);
            }
        });

    // Подключение к менеджеру тем UI-DS
    QObject::connect(&ThemeManager::instance(), &ThemeManager::themeChanged,
        this, &MainView::onThemeChanged);
}

void MainView::initColorGroups()
{
    //цветовые группы
    initColorGroup("Основные цвета", 
    {
        {"Основной", QColor("#1976D2")},
        {"Успех", QColor("#388E3C")},
        {"Ошибка", QColor("#D32F2F")},
        {"Предупреждение", QColor("#F57C00")}
    });

    initColorGroup("Альтернативные цвета", 
    {
        {"Альтернативный 1", QColor("#7B1FA2")},
        {"Альтернативный 2", QColor("#0097A7")},
        {"Альтернативный 3", QColor("#689F38")},
        {"Альтернативный 4", QColor("#FFA000")}
    });

    initColorGroup("Цвета компонентов", 
    {
        {"Фон", QColor("#FFFFFF")},
        {"Текст", QColor("#212121")},
        {"Граница", QColor("#E0E0E0")},
        {"Ховер", QColor("#F5F5F5")}
    });
}

void MainView::initColorGroup(const QString& groupName, const QVector<QPair<QString, QColor>>& colors)
{
    QWidget *colorGroupWidget = new QWidget();
    QGridLayout *gridLayout = new QGridLayout(colorGroupWidget);
    gridLayout->setSpacing(10);
    gridLayout->setContentsMargins(10, 10, 10, 10);

    int row = 0;
    for (const auto& [colorName, color] : colors) 
    {
        auto *nameLabel = new Label(colorName);
        gridLayout->addWidget(nameLabel, row, 0);

        QWidget *colorWidget = new QWidget();
        colorWidget->setStyleSheet(QString("background-color: %1; border: 1px solid #E0E0E0; border-radius: 4px;")
                                    .arg(color.name()));
        colorWidget->setFixedSize(60, 40);
        
        auto *colorValueLabel = new Label(color.name());
        colorValueLabel->setAlignment(Qt::AlignCenter);
        
        QVBoxLayout *colorLayout = new QVBoxLayout(colorWidget);
        colorLayout->addWidget(colorValueLabel);
        
        gridLayout->addWidget(colorWidget, row, 1);
        row++;
    }

    m_colorStack->addWidget(colorGroupWidget);
}

void MainView::onThemeChanged(TThemeName themeName)
{
    qDebug() << "Theme changed to:" << themeName;
}